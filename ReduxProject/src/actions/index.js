import {
  GET_TEXT,
  RECORDS_FETCH,
  TOGGLE,
  SHOW_OVERLAY,
  SELECTED_INDEX,
  SELECTED_COUNTRY_PICKER,
  SELECTED_CATEGORY_PICKER,
  DELETE_DATA_FROM_REALM,
} from '../types';

export const getText = (text) => ({
  type: GET_TEXT,
  payload: {text},
});

export const recordsFetch = () => ({
  type: RECORDS_FETCH,
});

export const setToggle = () => ({
  type: TOGGLE,
});

export const setShowOverlay = () => ({
  type: SHOW_OVERLAY,
});

export const setIndex = () => ({
  type: SELECTED_INDEX, 
});

export const setIndexAndValueCountry = (indexCountry, valueCountry) => ({
  type: SELECTED_COUNTRY_PICKER,
  payload: {indexCountry, valueCountry},
});

export const setIndexAndValueCategory = (indexCategory, valueCategory) => ({
  type: SELECTED_CATEGORY_PICKER,
  payload: {indexCategory, valueCategory},
});

export const deleteArticle = () => ({
  type: DELETE_DATA_FROM_REALM,
})